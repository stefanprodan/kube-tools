package main

import data.kubernetes

name = input.metadata.name

annotations {
  input.spec.selector.template.metadata.annotations["prometheus.io/scrape"]
}

deny[msg] {
	kubernetes.containers[container]
	[image_name, "latest"] = kubernetes.split_image(container.image)
	msg = sprintf("%s in the %s %s has an image, %s, using the latest tag", [container.name, kubernetes.kind, image_name, kubernetes.name])
}

warn[msg] {
  kubernetes.is_deployment
  not annotations
  msg = sprintf("Deployment %s should set prometheus.io/scrape pod annotation", [name])
}
